import { SERVER_URL } from "./login";

export async function addPurchase(
  UUID: string,
  points: number,
  jwt: string,
  purchaseID: string
): Promise<void> {
  const req = {
    uuid: UUID,
    purchase: {
      datetime: new Date().toISOString(),
      id: purchaseID,
      points,
      properties: {},
    },
  };
  return fetch(`${SERVER_URL}/addpurchase`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
      Authorization: jwt,
    },
    body: JSON.stringify(req),
  }).then(async (response) => {
    if (response.status === 200) {
      return;
    } else {
      console.log(response);
      throw new Error("Add purchase failed");
    }
  });
}
