import React, { Component } from 'react';

import { View } from 'react-native';

// import { Container } from './styles';

export default class Main extends Component {
    async componentDidMount() {
        await TrackPlayer.setupPlayer({});
        await TrackPlayer.add({
            id: 'track',
            url: 'http://tegos.kz/new/mp3_full/Luis_Fonsi_feat._Daddy_Yankee_-_Despacito.mp3', // just for test!
            title: 'Despacito',
            artist: 'Luis Fonsi Feat. Daddy Yankee',
            artwork: 'https://images-eu.ssl-images-amazon.com/images/I/61JH2ggghmL._AC_US160_.jpg'
        })
        TrackPlayer.play();
    }


    render() {
        return <View />;
    }
}
