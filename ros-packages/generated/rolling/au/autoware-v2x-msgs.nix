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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_v2x_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_v2x_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_v2x_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "08eeefdac0fe4c4cf5936ccd9ad8929962bb6ef4";
        hash = "sha256-H6FEqsNaN7hD4TinlTt/7RKqtSE0xaf8BD0TI63Oe4I=";
      };
    };
  });
  meta = {
    description = "Autoware v2x messages package.";
  };
})
