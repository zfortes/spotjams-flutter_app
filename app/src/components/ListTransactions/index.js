import React, { Component } from 'react';

import { View, Text, FlatList } from 'react-native';

import { Transactions } from './styles';


export default class ListTransactions extends Component {
    state = {
        transactions : [] 
    }

    componentDidMount(){
        var data = ({
            'item': 'Pagamento -20'
        },
        {
            'item' : 'Deposito + 20'
        })
        this.setState({transactions: data})
    }

    render() {
        return (
            <View>
                <Text>{this.state.transactions.length}</Text>
            </View>
        );
    }
}
