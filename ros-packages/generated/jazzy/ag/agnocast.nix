{
  agnocast-cie-config-msgs,
  agnocast-cie-thread-configurator,
  agnocast-components,
  agnocast-ioctl-wrapper,
  agnocast-sample-application,
  agnocast-sample-interfaces,
  agnocastlib,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros2agnocast,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator agnocast-components agnocast-ioctl-wrapper agnocast-sample-application agnocast-sample-interfaces agnocastlib ros2agnocast ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocast-cie-config-msgs agnocast-cie-thread-configurator agnocast-components agnocast-ioctl-wrapper agnocast-sample-application agnocast-sample-interfaces agnocastlib ros2agnocast ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast" = substituteSource {
      src = fetchgit {
        name = "agnocast-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "e0942a3e174d2566e0eb67a3e89d08e37057660d";
        hash = "sha256-tCI/FwwXy8MzD7y3NTeCruqdiayfpV/PpNEfWj0lvKw=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage for Agnocast: true zero-copy IPC middleware for ROS 2.\n  ";
  };
})
