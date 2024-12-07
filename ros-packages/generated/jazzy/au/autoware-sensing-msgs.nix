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
  pname = "autoware_sensing_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_sensing_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sensing_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "d702026a647cbd1242bbf240ca72960c63096cf3";
        hash = "sha256-rwtXiQ95ypISObUjmPuB7sOA8zfxLdhGHUr1Guse9Is=";
      };
    };
  });
  meta = {
    description = "Autoware sensing messages package.";
  };
})
