import React from 'react';
import ListTransactions from '~/components/ListTransactions'


import {
  Container, Titulo, Title,
} from './styles';

import {
  Text, Image, StyleSheet, Dimensions, ImageBackground, StatusBar, Body, View
} from 'react-native';


const Main = () => (
  <Container>
    <ListTransactions></ListTransactions>
    <Title>FakeBank Jose</Title>
    
  </Container>
);

export default Main;
