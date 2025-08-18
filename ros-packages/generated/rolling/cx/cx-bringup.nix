{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cx-ament-index-plugin,
  cx-clips-env-manager,
  cx-config-plugin,
  cx-example-plugin,
  cx-executive-plugin,
  cx-file-load-plugin,
  cx-protobuf-plugin,
  cx-ros-comm-gen,
  cx-ros-msgs-plugin,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cx_bringup";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."cx_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-ament-index-plugin cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin example-interfaces launch-ros std-msgs std-srvs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-ament-index-plugin cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin example-interfaces launch-ros std-msgs std-srvs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_bringup" = substituteSource {
      src = fetchgit {
        name = "cx_bringup-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "7ed6a9af4ef579d7116a7f51a2ade407835f4e9a";
        hash = "sha256-YIyDWP5yjlKN3Ri+hxzri40XdhamU4s8l9/5mq76Qlw=";
      };
    };
  });
  meta = {
    description = "Central CX bringup scripts and parameters for launching CLIPS example programs";
  };
})
