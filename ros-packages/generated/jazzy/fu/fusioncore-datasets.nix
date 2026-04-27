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
  version = "0.2.0-1";
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
        rev = "58de66820748a3f411eaea6d92802a8f3db2e61b";
        hash = "sha256-/VHuCsNZnmjqaUdVRZ+ANQsPUDGih/a7YXOC98rQw24=";
      };
    };
  });
  meta = {
    description = "NCLT dataset adapter and benchmark pipeline for FusionCore vs robot_localization";
  };
})
