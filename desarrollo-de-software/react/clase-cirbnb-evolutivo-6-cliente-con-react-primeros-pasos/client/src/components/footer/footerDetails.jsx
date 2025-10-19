import "./footerDetails.css"
import { FaPhoneAlt } from 'react-icons/fa';
import { FiMail } from 'react-icons/fi';
import { MdLocationPin } from 'react-icons/md';
const FooterDetails = (props) => {
    return(
        <div className="contact-details">
            <p><FaPhoneAlt/> Tel: {props.phone}</p>
            <p><FiMail/> Mail: {props.email}</p>
            <p><MdLocationPin/>Adress: {props.address}</p>
        </div>
    )
}
export default FooterDetails