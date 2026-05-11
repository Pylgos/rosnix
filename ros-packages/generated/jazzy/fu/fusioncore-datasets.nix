{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fusioncore-ros,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  robot-localization,
  rosSystemPackages,
  rosgraph-msgs,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fusioncore_datasets";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."fusioncore_datasets";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ fusioncore-ros geometry-msgs nav-msgs rclpy robot-localization rosgraph-msgs sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ fusioncore-ros geometry-msgs nav-msgs rclpy robot-localization rosgraph-msgs sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fusioncore_datasets" = substituteSource {
      src = fetchgit {
        name = "fusioncore_datasets-source";
        url = "https://github.com/manankharwar/fusioncore-release.git";
        rev = "3b9404a4d667a2aff82fe6ce8964a18688751e70";
        hash = "sha256-77dbFthGPCjxrgHCDU0XPa4c6AOktdNBYitHXFynM74=";
      };
    };
  });
  meta = {
    description = "NCLT dataset adapter and benchmark pipeline for FusionCore vs robot_localization";
  };
})
