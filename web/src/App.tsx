import { Searcher } from "./features/searcher/Searcher";
import { Layout, Menu } from "antd";
import "./App.css";
const { Header, Content, Footer } = Layout;

function App() {
  const minHeight = window.innerHeight - 134;

  return (
    <div className='App'>
      <Layout className='layout'>
        <Header>
          <div className='logo' />
          <Menu theme='dark' mode='horizontal' items={[]} />
        </Header>
        <Content style={{ padding: "0 50px", minHeight: minHeight }}>
          <div className='site-layout-content'>
            <Searcher />
          </div>
        </Content>
        <Footer style={{ textAlign: "center" }}>
          Dictionary App ©2022
        </Footer>
      </Layout>
    </div>
  );
}

export default App;
