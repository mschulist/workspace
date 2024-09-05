import { AdminInfo } from "@/components/AdminInfo";
import { AdminUsers } from "@/components/AdminUsers";
import { Purchases } from "@/components/Purchases";
import { UserInfo } from "@/components/UserInfo";
import { Ionicons } from "@expo/vector-icons";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { NavigationContainer } from "@react-navigation/native";
import React from "react";

export default function AdminHome() {
  const Tab = createBottomTabNavigator();
  return (
    <NavigationContainer independent>
      <Tab.Navigator>
        <Tab.Screen
          name="Users"
          component={AdminUsers}
          options={{
            tabBarIcon: () => (
              <Ionicons name="person-circle-outline" size={24} />
            ),
          }}
        />
        <Tab.Screen
          name="Admin Info"
          component={AdminInfo}
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
