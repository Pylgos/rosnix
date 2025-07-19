{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cob_msgs";
  version = "2.8.12-2";
  src = finalAttrs.passthru.sources."cob_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_msgs" = substituteSource {
      src = fetchgit {
        name = "cob_msgs-source";
        url = "https://github.com/ros2-gbp/cob_common-release.git";
        rev = "4a52fb3e9e0f2fca93777299a078f1d7b3800d90";
        hash = "sha256-QHO8hbSMdjYRconeKHOu4+iWuEDwoY/LK92IqUq/lAY=";
      };
    };
  });
  meta = {
    description = "\n    Messages for representing state information, such as battery information and emergency stop status.\n  ";
  };
})
