package com.navigation.reactnative;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.ViewOutlineProvider;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.uimanager.PixelUtil;
import com.facebook.react.uimanager.UIManagerModule;
import com.facebook.react.uimanager.events.Event;
import com.facebook.react.uimanager.events.RCTEventEmitter;
import com.google.android.material.appbar.AppBarLayout;

public class NavigationBarView extends AppBarLayout {
    ViewOutlineProvider defaultOutlineProvider;
    Drawable defaultBackground;

    public NavigationBarView(Context context) {
        super(context);
        setLayoutParams(new AppBarLayout.LayoutParams(AppBarLayout.LayoutParams.MATCH_PARENT, AppBarLayout.LayoutParams.WRAP_CONTENT));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            defaultOutlineProvider = getOutlineProvider();
        }
        defaultBackground = getBackground();
        addOnOffsetChangedListener(new OnOffsetChangedListener() {
            @Override
            public void onOffsetChanged(AppBarLayout appBarLayout, int offset) {
                OffsetChangedEvent event = new OffsetChangedEvent();
                event.init(getId(), offset);
                ReactContext reactContext = (ReactContext) getContext();
                reactContext.getNativeModule(UIManagerModule.class).getEventDispatcher().dispatchEvent(event);
            }
        });
    }

    static class OffsetChangedEvent extends Event<OffsetChangedEvent> {
        private int offset;

        private OffsetChangedEvent() {
        }

        private void init(int viewTag, int offset) {
            super.init(viewTag);
            this.offset = offset;
        }

        @Override
        public String getEventName() {
            return "onOffsetChanged";
        }

        @Override
        public void dispatch(RCTEventEmitter rctEventEmitter) {
            WritableMap event = Arguments.createMap();
            event.putInt("offset", (int) PixelUtil.toDIPFromPixel(offset));
            rctEventEmitter.receiveEvent(getViewTag(), getEventName(), event);
        }
    }
}
