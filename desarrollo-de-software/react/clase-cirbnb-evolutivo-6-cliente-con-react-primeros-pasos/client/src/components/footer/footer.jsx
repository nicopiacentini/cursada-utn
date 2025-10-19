import "./footer.css"
import FooterDetails from "./footerDetails.jsx"
const Footer = () =>{
    return(
        <footer className="footer" >
            <FooterDetails phone="+54 11 1234-5678"
                email="contacto@ejemplo.com"
                address="Calle Falsa 123, Ciudad"></FooterDetails>
        </footer>
    )
}
export default Footer