{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_sample_vehicle_description";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_sample_vehicle_description";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ xacro ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ xacro ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sample_vehicle_description" = substituteSource {
      src = fetchgit {
        name = "autoware_sample_vehicle_description-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "9a29f1e5b9e741a27849941305fd274fcfe080fc";
        hash = "sha256-LQjU6+iHSMdRzrL+eHsviHwgBx38z7StYfCuCYdnRts=";
      };
    };
  });
  meta = {
    description = "The autoware_sample_vehicle_description package";
  };
})
