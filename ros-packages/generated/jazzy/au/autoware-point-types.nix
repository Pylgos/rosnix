{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-cppcheck,
  ament-cmake-export-dependencies,
  ament-cmake-lint-cmake,
  ament-cmake-ros,
  ament-cmake-test,
  ament-cmake-xmllint,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-ros,
  point-cloud-msg-wrapper,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_point_types";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_point_types";
  nativeBuildInputs = [ ament-cmake-export-dependencies autoware-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint pcl-ros point-cloud-msg-wrapper ];
  buildInputs = [ ament-cmake-export-dependencies autoware-cmake ];
  propagatedBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint pcl-ros point-cloud-msg-wrapper ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common point-cloud-msg-wrapper ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_point_types" = substituteSource {
      src = fetchgit {
        name = "autoware_point_types-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "c1c5a60a40f82d7c15c5e1f7d3730e39aa902c6b";
        hash = "sha256-rAQuc41tyIZ1OY+KkRw3N9P/aXbofy2gSnQstgKx3S0=";
      };
    };
  });
  meta = {
    description = "The point types definition to use point_cloud_msg_wrapper";
  };
})
