package com.siampiwat.indoormap

import android.content.Intent
import android.util.Log
import com.facebook.react.bridge.*
import com.google.gson.Gson
import com.siampiwat.indoormapsdk.IndoorMapSDK
import com.siampiwat.indoormapsdk.presentation.view.indoormap.IndoorMapActivity

public class RNIndoormapModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    public override fun getName(): String {
        return "SPWIndoorMap"
    }

    @ReactMethod
    public fun setStores(stores: ReadableArray) {
        var gson = Gson()
        var shop = mapOf("shop" to stores.toArrayList())
        var jsonString = gson.toJson(shop)
        IndoorMapSDK.getInstance().setAISShops(jsonString)
    }

    @ReactMethod
    public fun getStore(storeId: String, successCallback: Callback) {
        successCallback(IndoorMapSDK.getInstance().getStoreById(storeId)?.toJsonString())
    }

    @ReactMethod
    public fun getAllStoresJSON(successCallback: Callback) {
        successCallback.invoke(IndoorMapSDK.getInstance().getStoresJson())
    }

    @ReactMethod
    public fun setFloorNumber(floorNumber: Int) {
        IndoorMapSDK.getInstance().setFloor(floorNumber)
    }

    @ReactMethod
    public fun setOrigin(storeId: String) {
        var store = IndoorMapSDK.getInstance().getStoreById(storeId)
        if (store != null) {
            IndoorMapSDK.getInstance().setOriginByStore(store)
        }
    }

    @ReactMethod
    public fun setDestination(storeId: String) {
        var store = IndoorMapSDK.getInstance().getStoreById(storeId)
        if (store != null) {
            IndoorMapSDK.getInstance().setDestinationByStore(store)
        }
    }

    @ReactMethod
    public fun getVenuesSuccessCallback(successCallback: Callback, failureCallback: Callback) {
        IndoorMapSDK.getInstance().getVenue(object : IndoorMapSDK.GetVenueCallback {
            override fun onSuccess() {
                successCallback.invoke("")
                Log.i("SPWIndoorMap","Get venues successfully")
            }

            override fun onFailed(e: Throwable) {
                failureCallback.invoke(e.localizedMessage)
            }
        })
    }

    @ReactMethod
    public fun presentIndoorMap() {
        val intent = Intent(reactApplicationContext, IndoorMapView::class.java) // mContext got from your overriden constructor
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        reactApplicationContext.startActivity(intent)
    }
}

class IndoorMapView : IndoorMapActivity() {
    override fun onIndoorMapError(exception: Exception) {
        Log.i("SPWIndoorMap", "onIndoorMapError")
    }
}