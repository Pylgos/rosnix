{
  ament-cmake,
  ament-cmake-copyright,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "auto_apms_interfaces";
  version = "1.5.0-1";
  src = finalAttrs.passthru.sources."auto_apms_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-cmake-copyright ];
  passthru.sources = mkSourceSet (sources: {
    "auto_apms_interfaces" = substituteSource {
      src = fetchgit {
        name = "auto_apms_interfaces-source";
        url = "https://github.com/ros2-gbp/autoapms-release.git";
        rev = "18a653a2951356623b006e7a6c93399856629ab3";
        hash = "sha256-sw0pMkouMFwU54PG6p5jgVc/nScE+RHrRs4dX3h9YzM=";
      };
    };
  });
  meta = {
    description = "ROS 2 interfaces for AutoAPMS";
  };
})
