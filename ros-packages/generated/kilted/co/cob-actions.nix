{
  action-msgs,
  actionlib-msgs,
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
  version = "2.8.12-2";
  src = finalAttrs.passthru.sources."cob_actions";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs actionlib-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs actionlib-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_actions" = substituteSource {
      src = fetchgit {
        name = "cob_actions-source";
        url = "https://github.com/ros2-gbp/cob_common-release.git";
        rev = "79913ae01916f759a0eac226eeabffcbcc1155d2";
        hash = "sha256-+iPs1yyXAzJHC1Xxx+YFd1cp0MWK4ajWUuesPyRMsOw=";
      };
    };
  });
  meta = {
    description = "This Package contains Care-O-bot specific action definitions.";
  };
})
