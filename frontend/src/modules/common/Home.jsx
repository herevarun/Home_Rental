import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import Navbar from 'react-bootstrap/Navbar';
import { Container, Nav, Button } from 'react-bootstrap';
import Carousel from 'react-bootstrap/Carousel';
import p1 from '../../images/pic1.jpg'
import p2 from '../../images/pic2.jpg'
import p3 from '../../images/pic3.jpg'
import p4 from '../../images/pic4.jpg'
import AllPropertiesCards from '../user/AllPropertiesCards';

const Home = () => {
   const [index, setIndex] = useState(0);

   const handleSelect = (selectedIndex) => {
      setIndex(selectedIndex);
   };
   return (
      <>
         <Navbar expand="lg" className="bg-body-tertiary navbar">
            <Container fluid>
               <Navbar.Brand>
                  <img className='logo-img' src="logo.png"/>
                  <h2>RentEase</h2>
               </Navbar.Brand>
               <Navbar.Toggle aria-controls="navbarScroll" />
               <Navbar.Collapse id="navbarScroll">
                  <Nav
                     className="me-auto my-2 my-lg-0"
                     style={{ maxHeight: '100px' }}
                     navbarScroll
                  >
                  </Nav>
                  <Nav className='navbar-brand navtext'>
                     <Link to={'/'} className='navhover'>Home</Link>
                     <Link to={'/login' } className='navhover'>Login</Link>
                     <Link to={'/register'} className='navhover'>Register</Link>
                     <Link to={'/'} className='navhover'>Contact Us</Link>
                     <img className='sign' src="sign.png"/>
                  </Nav>

               </Navbar.Collapse>
            </Container>
         </Navbar>


         <div className='home-body'>
            <Carousel activeIndex={index} onSelect={handleSelect} className='images'>
               <Carousel.Item>
                  <img 
                     src={p1}
                     alt="First slide"
                  />
               </Carousel.Item>
               <Carousel.Item>
                  <img
                     src={p2}
                     alt="Second slide"
                  />
               </Carousel.Item>
               <Carousel.Item>
                  <img
                     src={p3}
                     alt="Third slide"
                  />
               </Carousel.Item>
               <Carousel.Item>
                  <img
                     src={p4}
                     alt="Fourth slide"
                  />
               </Carousel.Item>
            </Carousel>
         </div>


         <div className='property-content'>
            <div className='text-center'>
               <h1 className='m-1 p-5'>All Properties that may you look for</h1>
               <p style={{fontSize: 15, fontWeight: 800}}>Want to post your Property? <Link to={'/register'}><Button variant='outline-info'>Register as Owner</Button></Link></p>
            </div>

            <Container>
               <AllPropertiesCards />
            </Container>
         </div>
      </>
   )
}

export default Home
