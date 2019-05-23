import React, { Component } from 'react';

import { View, Text, FlatList, ListItem } from 'react-native';


import { CardTransaction, Container, Item, TitleTransaction, Value, Line } from './styles';


export default class ListTransactions extends Component {
  state = {
    transactions: []
  }

  async componentDidMount() {
    var data = [{
      acao: 'Pagamento',
      value: 'R$ 102,00',
      signal: '-'
    },
    {
      acao: 'Deposito',
      value: 'R$ 100,00',
      signal: '+'
    },
    {
      acao: 'Saque',
      value: 'R$ 20,00',
      signal: '-'
    }, {
      acao: 'Deposito',
      value: 'R$ 55,00',
      signal: '+'
    },
    {
      acao: 'Deposito',
      value: 'R$ 200,00',
      signal: '+'
    },
    {
      acao: 'Deposito',
      value: 'R$ 60,00',
      signal: '+'
    },
    {
      acao: 'Transferencia',
      value: 'R$ 55,00'
      ,
      signal: '-'
    },
    {
      acao: 'Pagamento',
      value: 'R$ 102,00',
      signal: '-'
    },
    {
      acao: 'Deposito',
      value: 'R$ 100,00',
      signal: '+'
    },
    {
      acao: 'Saque',
      value: 'R$ 20,00',
      signal: '-'
    },
    {
      acao: 'Saque',
      value: 'R$ 20,00',
      signal: '-'
    }]
    this.setState({ transactions: data })
  }
  //[{ key: 'a' }, { key: 'b' }, { key: 'c' }, { key: 'd' }, { key: 'e' }, { key: 'f' }, { key: 'a' }, { key: 'b' }, { key: 'c' }, { key: 'd' }, { key: 'e' }, { key: 'f' }, { key: 'a' }, { key: 'b' }, { key: 'c' }, { key: 'd' }, { key: 'e' }, { key: 'f' }]
  render() {
    return (
      <FlatList
        data={this.state.transactions}
        renderItem={({ item }) => (
          <Item>
            <TitleTransaction>{item.acao}</TitleTransaction>
            <Value>{item.signal}{item.value}</Value>
          </Item>
        )}
      />
    );
  }
}
