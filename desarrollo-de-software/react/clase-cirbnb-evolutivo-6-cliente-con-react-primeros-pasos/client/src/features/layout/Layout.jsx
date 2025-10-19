import { Outlet } from "react-router";
import Header from "../../components/headers/Header.jsx";
import Navbar from "../../components/headers/Navbar.jsx";
import Footer from "../../components/footer/footer.jsx"

const Layout = () => {
    return(
        <>
          <Header username="Capo"></Header>
          <Navbar></Navbar>
          <Outlet />
          <Footer></Footer>
        </>
    )
}

export default Layout;