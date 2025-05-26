{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_planning_msgs";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_planning_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_planning_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_planning_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "bba4ddf28bdcb1b0cc35e8fdafdd401f23731968";
        hash = "sha256-ZItayLG+dP5IbLt6Cje9t+qvG+D7P+aQTWhTu/nxMSE=";
      };
    };
  });
  meta = {
    description = "Autoware planning messages package.";
  };
})
