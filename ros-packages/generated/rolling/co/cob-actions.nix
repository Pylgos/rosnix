{
  action-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cob_actions";
  version = "2.8.12-1";
  src = finalAttrs.passthru.sources."cob_actions";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "actionlib_msgs" ]; };
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "actionlib_msgs" ]; };
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_actions" = substituteSource {
      src = fetchgit {
        name = "cob_actions-source";
        url = "https://github.com/ros2-gbp/cob_common-release.git";
        rev = "9de65746ff18225218b2c90c15328a2f93ff40f2";
        hash = "sha256-+iPs1yyXAzJHC1Xxx+YFd1cp0MWK4ajWUuesPyRMsOw=";
      };
    };
  });
  meta = {
    description = "This Package contains Care-O-bot specific action definitions.";
  };
})
