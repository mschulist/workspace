import { UserInfo } from "@/components/UserInfo";
import { Purchases } from "@/components/Purchases";
import React from "react";
import { useState } from "react";
import { Card, Text, BottomNavigation } from "react-native-paper";
import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { Ionicons } from "@expo/vector-icons";

export default function Home() {
  const Tab = createBottomTabNavigator();

  return (
    <NavigationContainer independent>
      <Tab.Navigator>
        <Tab.Screen
          name="Purchases"
          component={Purchases}
          options={{
            tabBarIcon: () => <Ionicons name="cart-outline" size={24} />,
          }}
        />
        <Tab.Screen
          name="User"
          component={UserInfo}
          options={{
            tabBarIcon: () => (
              <Ionicons name="person-circle-outline" size={24} />
            ),
          }}
        />
      </Tab.Navigator>
    </NavigationContainer>
  );
}
