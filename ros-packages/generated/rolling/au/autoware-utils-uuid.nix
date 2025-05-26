{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_uuid";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_uuid";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ unique-identifier-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_uuid" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_uuid-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "43bdd7d9ff002a575db5ff9d2a3b5add85fe91f3";
        hash = "sha256-ad5az+bpuy23gSmyhX+faaDaGwPS3QvyrFEqTFpsbxs=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_uuid package";
  };
})
