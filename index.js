import { NativeModules } from "react-native";
const { SPWIndoorMap } = NativeModules;

export const presentIndoorMap = () => {
  SPWIndoorMap.presentIndoorMap();
};

export const getAllStores = (successCallback) => {
  SPWIndoorMap.getAllStoresJSON((res) => {
    successCallback(JSON.parse(res));
  });
};

export const setOrigin = (store_id) => {
  SPWIndoorMap.setOrigin(store_id);
};

export const setDestination = (store_id) => {
  SPWIndoorMap.setDestination(store_id);
};

export const setFloorNumber = (floorNumber) => {
  if (floorNumber != null) {
    SPWIndoorMap.setFloorNumber(floorNumber);
  }
};

export const setStores = (stores) => {
  SPWIndoorMap.setStores(stores);
};

export const getStore = (store_id, successCallback) => {
  SPWIndoorMap.getStore(store_id, (res) => {
    successCallback(JSON.parse(res));
  });
};

export const getVenues = (successCallback, errorCallback) => {
  SPWIndoorMap.getVenuesSuccessCallback(
    () => {
      successCallback();
    },
    (error) => {
      errorCallback(error);
    }
  );
};
