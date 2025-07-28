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
  version = "2.2.3-1";
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
        rev = "d04e7680db02261c707d9fc424531fee048bd839";
        hash = "sha256-dfyZuETffynY5m2aoQaLV5UW30qTkrIIC4jUfKnIXzs=";
      };
    };
  });
  meta = {
    description = "\n    Tools related to the Mobile Robot Programming Toolkit (MRPT).\n    Refer to https://wiki.ros.org/mrpt_navigation for further documentation.\n  ";
  };
})
