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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."autoware_sensing_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "autoware_sensing_msgs" = substituteSource {
        src = fetchgit {
          name = "autoware_sensing_msgs-source";
          url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
          rev = "5f6a338ee284e8c28a7be0fb1dbfa389738a96a3";
          hash = "sha256-QsGGyrnlX8eEVMuvlkf64xK01PfPNfnCBSNR85qA3bY=";
        };
      };
    });
  };
  meta = {
    description = "Autoware sensing messages package.";
  };
})
