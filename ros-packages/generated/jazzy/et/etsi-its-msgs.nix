{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cam-msgs,
  etsi-its-cam-ts-msgs,
  etsi-its-cpm-ts-msgs,
  etsi-its-denm-msgs,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_msgs";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cam-msgs etsi-its-cam-ts-msgs etsi-its-cpm-ts-msgs etsi-its-denm-msgs etsi-its-vam-ts-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_msgs" = substituteSource {
        src = fetchgit {
          name = "etsi_its_msgs-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "3294f2d9d95a185086472f6d7b4966ca8e369148";
          hash = "sha256-LnrIZchCQsuReJ8o2rsJnZV/FYYnX/REQ4eJxbCWyoE=";
        };
      };
    });
  };
  meta = {
    description = "ROS messages for ETSI ITS messages";
  };
})
