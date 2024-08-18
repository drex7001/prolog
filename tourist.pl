% Facts about tourist places in Sri Lanka

% Destination(Name, Type, Climate, Location, Activities).
destination(sigiriya, cultural, dry, central, [hiking, history, sightseeing]).
destination(kandy, cultural, mild, central, [temple, history, shopping]).
destination(galle, coastal, tropical, southern, [beach, history, sightseeing]).
destination(ella, nature, cool, central, [hiking, nature, scenic]).
destination(colombo, urban, tropical, western, [shopping, nightlife, sightseeing]).
destination(anuradhapura, cultural, dry, north_central, [history, temple, sightseeing]).
destination(yala, wildlife, dry, southern, [safari, wildlife, nature]).
destination(mirissa, coastal, tropical, southern, [beach, whale_watching, relaxation]).


% Rule to recommend a destination based on user preferences
recommend_place(Type, Climate, Location, Activity, Place) :-
    destination(Place, Type, Climate, Location, Activities),
    member(Activity, Activities).
