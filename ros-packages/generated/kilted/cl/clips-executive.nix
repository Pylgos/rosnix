{
  ament-cmake,
  buildAmentCmakePackage,
  cx-ament-index-plugin,
  cx-bringup,
  cx-clips-env-manager,
  cx-config-plugin,
  cx-example-plugin,
  cx-executive-plugin,
  cx-file-load-plugin,
  cx-msgs,
  cx-plugin,
  cx-protobuf-plugin,
  cx-ros-comm-gen,
  cx-ros-msgs-plugin,
  cx-tf2-pose-tracker-plugin,
  cx-utils,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clips_executive";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."clips_executive";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-ament-index-plugin cx-bringup cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-msgs cx-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin cx-tf2-pose-tracker-plugin cx-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-ament-index-plugin cx-bringup cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-msgs cx-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin cx-tf2-pose-tracker-plugin cx-utils ];
  passthru.sources = mkSourceSet (sources: {
    "clips_executive" = substituteSource {
      src = fetchgit {
        name = "clips_executive-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "15544085df851d81e4900d3188f28e308dba87b7";
        hash = "sha256-f55H9JMejIcFlzHSyY4/4CYGUU+EfDd4fS4DopQEfts=";
      };
    };
  });
  meta = {
    description = "ROS2 CLIPS-Executive meta package and documentation";
  };
})
