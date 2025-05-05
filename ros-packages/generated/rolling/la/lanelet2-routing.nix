{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_routing";
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_routing";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_routing" = substituteSource {
      src = fetchgit {
        name = "lanelet2_routing-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "40b695e5e8e5ae3a15b85c2fc6d5808b0fea47e4";
        hash = "sha256-nGVDdE1W8o7u9mMs1LHE5cT4A9mFdBo3NEHLB0QeZqE=";
      };
    };
  });
  meta = {
    description = "Routing module for lanelet2";
  };
})
