import React, {useEffect} from 'react';
import {
  SafeAreaView,
  ScrollView,
  View,
  NativeModules,
  NativeEventEmitter,
  Button,
} from 'react-native';

import {Header} from 'react-native/Libraries/NewAppScreen';
// import {Button} from 'rn-module';
import {IUser, TCheck} from 'rn-module/dist/typings';

const App = () => {
  const user: IUser = {firstName: 'stes', id: 'asd', lastName: 'tes'};
  const check: TCheck = 123;
  console.log('🚀 --- App --- user', user, check);

  //Method 1
  // console.log('NativeModules', NativeModules.Fastis);

  // NativeModules.Fastis.incrementCount(callback =>
  //   console.log('Callback:', callback),
  // );

  // const decreaseCount = async () => {
  //   try {
  //     const results = await NativeModules.Fastis.decrementCount();
  //     console.log('🚀 --- App --- results', results);
  //   } catch (error) {
  //     console.log(error);
  //   }
  // };

  //Method 2
  //Native Event Emitters
  const CounterEvents = new NativeEventEmitter(NativeModules.Fastis);

  useEffect(() => {
    CounterEvents.addListener('incrementCount', res =>
      console.log('Increment Event', res),
    );

    // CounterEvents.addListener('decrementCount', res =>
    //   console.log('Decrement Event', res),
    // );

    return () => {
      CounterEvents.removeAllListeners();
    };
  }, []);

  const increaseCount = () => {
    NativeModules.Fastis.incrementCount(res => console.log(res));
  };

  const decreaseCount = async () => {
    try {
      const results = await NativeModules.Fastis.decrementCount();
      console.log('🚀 --- App --- results', results);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior="automatic">
        <Header />
        <View>
          <Button title="increment" onPress={increaseCount} />

          <Button title="decrement" onPress={decreaseCount} />
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

export default App;
