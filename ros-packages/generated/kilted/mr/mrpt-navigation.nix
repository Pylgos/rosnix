{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-map-server,
  mrpt-nav-interfaces,
  mrpt-pf-localization,
  mrpt-pointcloud-pipeline,
  mrpt-rawlog,
  mrpt-reactivenav2d,
  mrpt-tutorials,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_navigation";
  version = "2.2.4-1";
  src = finalAttrs.passthru.sources."mrpt_navigation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mrpt-map-server mrpt-nav-interfaces mrpt-pf-localization mrpt-pointcloud-pipeline mrpt-rawlog mrpt-reactivenav2d mrpt-tutorials ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto mrpt-map-server mrpt-nav-interfaces mrpt-pf-localization mrpt-pointcloud-pipeline mrpt-rawlog mrpt-reactivenav2d mrpt-tutorials ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_navigation" = substituteSource {
      src = fetchgit {
        name = "mrpt_navigation-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "0f22dd6697b85d2a9599e5c551807c815c1a6492";
        hash = "sha256-cr/Dl0ZD6TS64P/kR4qUfS/CjKKuKe7UChmnTB9cat4=";
      };
    };
  });
  meta = {
    description = "\n    Tools related to the Mobile Robot Programming Toolkit (MRPT).\n    Refer to https://wiki.ros.org/mrpt_navigation for further documentation.\n  ";
  };
})
