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
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_v2x_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_v2x_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_v2x_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_v2x_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "a463028108f9b8fb6ba517309efba43152c2e44e";
        hash = "sha256-6cHbxqIEtkWuqDYOMrhMvUoWosDiQ2ytfvIMlSeK4ss=";
      };
    };
  });
  meta = {
    description = "Autoware v2x messages package.";
  };
})
