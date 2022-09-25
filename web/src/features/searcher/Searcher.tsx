import { Input, Divider, Typography, Spin } from "antd";
import { useAppSelector, useAppDispatch } from "../../app/hooks";
import {
  searchAsync,
  selectWord,
  selectMeaning,
  selecStatus,
} from "./searcherSlice";
import { Meaning } from "./Meaning";

const { Search } = Input;
const { Title } = Typography;

export function Searcher() {
  const status = useAppSelector(selecStatus);
  const word = useAppSelector(selectWord);
  const meaning = useAppSelector(selectMeaning);

  const dispatch = useAppDispatch();

  const onSearch = (value: string) => {
    dispatch(searchAsync(value));
  };

  let content;
  switch (status) {
    case "initialized":
      content = <div>Explore the Dictionary</div>;
      break;
    case "idle":
      content = (
        <div>
          <Title style={{ fontWeight: "400" }}>{word?.word}</Title>
          <Divider />
          {meaning.map((e, i) => (
            <Meaning key={i} type={e.word_type} meaning={e.meaning} />
          ))}
        </div>
      );
      break;
    case "loading":
      content = <Spin size='large' />;
      break;
    default:
      content = <div>Your search terms did not match any entries.</div>;
      break;
  }

  return (
    <div>
      <Search placeholder='input search text' onSearch={onSearch} enterButton />
      <Divider />
      <div>
        {content}
      </div>
    </div>
  );
}
