import { faBell, faSignOutAlt } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useEffect } from 'react';
import Modal from 'react-modal';
import { BrowserRouter } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { Col, Container, Nav, NavItem, NavLink, Row } from "reactstrap";
import { WebcamCapture } from "../src/components/camera/Webcam";
import '../src/components/camera/webcamStyles.css';
import "./App.css";
import { db } from './DBConfig';
import POS from "./pages/pos/";
let _ = require('lodash');
 

function App() {

  
  const [isClick,setIsClick] = React.useState(false);
  const [name, setName] = React.useState('Dev Operator')
  const [image,setImage]=React.useState('');

 
  
  useEffect(() => { 
    db.collection('tbl_profile').get().then(item => {
      _.forEach(item, function(value, key) {    
        setImage(value.photo);   
      });
    }) 

  },[name]);
 
 

  function closeModal() {
    setIsClick(false);
  }

  const submitForm = () => {
    
    db.collection('tbl_profile').doc({ id: 2222 }).update({
      name: name
    })
    setIsClick(false);
  
}

  return (
    <BrowserRouter>

      <div className="App">

        <header className="App-header">
          <Container fluid={true}>
            <Row>
              <Col sm="3" className="text-center header-col-brand">
                PWA POS REACT
              </Col>
              <Col sm="3" className="text-center connection_status">
                {
                  !navigator.onLine ? 'You`re offline Mode' : null
                }
                 
              </Col>
              <Col sm="6" className="header-col-nav">
                <Nav className=" ml-auto">
                  <NavItem>
                    <div className="profile">
                      <div className="name">{name}</div>
                      <div className="image">
                      <button style={{border:0,backgroundColor: '#fec239' }} onClick={()=> setIsClick(true)} >
                        <img
                            alt="profile-photos"
                            className="rounded-circle"
                            src={image}
                            height="40px"
                            width="40px" 
                          />
                        </button> 
                        
                      </div>
                    </div>
                  </NavItem>
                  <NavItem>
                    <NavLink className="navlink-padding" href="#">
                      <FontAwesomeIcon icon={faBell} size="lg" />
                    </NavLink>
                  </NavItem>
                  <NavItem>
                    <NavLink className="navlink-padding" href="#">
                      <FontAwesomeIcon icon={faSignOutAlt} size="lg" />
                    </NavLink>
                  </NavItem>
                </Nav>
              </Col>
            </Row>
          </Container>
        </header>
        <main className="main-app">
          <Container className="container-main" fluid>           
            <POS />
          </Container>
        </main>
      </div>
      <ToastContainer
        position="top-right"
        autoClose={3000}
        hideProgressBar={false}
        newestOnTop={true}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
      />

      <Modal
        isOpen={isClick}
        onRequestClose={closeModal}
         
      >
         
         <div className="home-container">
            <div className="container">
                <div className="text">
                     
                    <form className="form">
                        <WebcamCapture/>
                        <input type="text" placeholder="Name" onChange={(e) => setName(e.target.value)} />
                        <button type="submit" id="login-button" onClick={(e) => submitForm(e)}>Submit</button>
                        
                    </form>
                    <button onClick={closeModal}>close</button>
                </div>
            </div>
        </div>
         
      </Modal>
    </BrowserRouter>
  );
}

export default App;
