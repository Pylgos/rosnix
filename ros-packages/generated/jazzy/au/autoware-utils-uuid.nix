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
  version = "1.7.2-1";
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
        rev = "f17e9a1fe45b7f703c7106ff380a7f4cd66c90fa";
        hash = "sha256-JA431XV7Buy+lpX7wihH1s7LhMWjSSz8zgQSIBCo+AE=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_uuid package";
  };
})
