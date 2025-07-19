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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."cx_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cx-ament-index-plugin cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin example-interfaces launch-ros std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cx-ament-index-plugin cx-clips-env-manager cx-config-plugin cx-example-plugin cx-executive-plugin cx-file-load-plugin cx-protobuf-plugin cx-ros-comm-gen cx-ros-msgs-plugin example-interfaces launch-ros std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cx_bringup" = substituteSource {
      src = fetchgit {
        name = "cx_bringup-source";
        url = "https://github.com/ros2-gbp/clips_executive-release.git";
        rev = "9af160e6e4fdf134c272c20044ce45880ff1a0e1";
        hash = "sha256-qVwBBZcevIDFgHAv4kEGV3c4IVNAOr5NRo+hVHSeA3g=";
      };
    };
  });
  meta = {
    description = "Central CX bringup scripts and parameters for launching CLIPS example programs";
  };
})
