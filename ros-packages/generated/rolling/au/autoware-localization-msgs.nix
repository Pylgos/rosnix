{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_localization_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_localization_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_localization_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_localization_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "a2817f3ac2d104b0f26d8b2eaa8060a360d3ddaf";
        hash = "sha256-sgyBm73hXRIsA7o+cTm2ENEhnnmrjarSzzw6sLRJlts=";
      };
    };
  });
  meta = {
    description = "Autoware localization messages package.";
  };
})
