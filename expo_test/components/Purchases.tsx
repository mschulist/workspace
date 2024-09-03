import React, { useState } from "react";
import { Button, Card, Text } from "react-native-paper";
import { useAuth } from "./Auth";
import { Purchase } from "@/auth/authModel";
import { RefreshControl, ScrollView } from "react-native";

export function Purchases() {
  const [refreshing, setRefreshing] = useState(false);

  const { user, getUser } = useAuth();

  const onRefresh = React.useCallback(() => {
    setRefreshing(true);
    getUser();
    setRefreshing(false);
  }, []);

  console.log("User2: ", user);
  return (
    <ScrollView
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }
    >
      <Card>
        {user?.purchases == null && <Card.Title title="No Purchases" />}
        {user?.purchases != null &&
          user?.purchases.map((purchase) => (
            <PurchaseComponent key={purchase.id} {...purchase} />
          ))}
      </Card>
    </ScrollView>
  );
}

function PurchaseComponent(purchase: Purchase) {
  const date = new Date(purchase.datetime);

  function toDateTimeString(date: Date) {
    const dayOfWeek = date.toLocaleString("default", { weekday: "long" });
    const month = date.toLocaleString("default", { month: "long" });
    const day = date.getDate();
    const year = date.getFullYear();

    const hour = date.getHours();
    const minute = date.getMinutes();
    const ampm = hour >= 12 ? "PM" : "AM";
    const hour12 = hour % 12 || 12;

    return `${dayOfWeek}, ${month} ${day}, ${year} ${hour12}:${minute} ${ampm}`;
  }
  return (
    <Card>
      <Card.Title title={`Purchase ID: ${purchase.id}`} subtitle={toDateTimeString(date)} />
      <Card.Content>
        <PurchaseProperties properties={purchase.properties} />
      </Card.Content>
    </Card>
  );
}

function PurchaseProperties({
  properties,
}: {
  properties: Object;
}): React.ReactElement {
  if (!properties) {
    return <></>
  }
  return (
    <Card.Content>
      {Object.entries(properties).map(([key, value]) => (
        <Text key={key}>
          {key}: {value}
        </Text>
      ))}
    </Card.Content>
  );
}
