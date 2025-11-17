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
  version = "1.11.0-1";
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
        rev = "19fd9b1f0486ffc26ee40e2ebb2d8045e39481d4";
        hash = "sha256-m0Mqfb9CoIe14arPpbW3g18hsEywswcPEiJ79qCSjvo=";
      };
    };
  });
  meta = {
    description = "Autoware v2x messages package.";
  };
})
