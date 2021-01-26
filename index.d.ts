
export declare const callback: (res: object) => void

export function presentIndoorMap(): void;
export function getAllStores(callback?: callback): void;
export function setFloorNumber(floorNumber?: int): void;
export function setOrigin(store_id?: string): void;
export function setDestination(store_id?: string): void;
export function getStore(store_id?: string, callback?: callback): void;
export function setStores(stores?: object): void;
export function getVenues(successCallback?: callback, errorCallback?: callback): void;