import { Typography, Divider } from "antd";

const { Paragraph, Text } = Typography;

export function Meaning(props: { type: string; meaning: string }) {
  let wordType;
  if (!props.type || props.type.length === 0) {
    wordType = <div></div>;
  } else {
    wordType = <Text code>{props.type}</Text>;
  }

  return (
    <div>
      {wordType}
      <Paragraph>{props.meaning}</Paragraph>
      <Divider />
    </div>
  );
}
