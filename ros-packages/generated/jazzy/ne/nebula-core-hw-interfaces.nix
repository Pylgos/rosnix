{
  ament-cmake-gtest,
  ament-lint-auto,
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_core_hw_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_core_hw_interfaces";
  nativeBuildInputs = [ autoware-cmake ];
  propagatedNativeBuildInputs = [ nebula-core-common ];
  buildInputs = [ autoware-cmake ];
  propagatedBuildInputs = [ nebula-core-common ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_core_hw_interfaces" = substituteSource {
      src = fetchgit {
        name = "nebula_core_hw_interfaces-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "c5fe57057779f5ed24af4f58cdda0935e3b390c7";
        hash = "sha256-p0tz8VBssYSQ7pAUS11oxJ6R6zc2jNLIriHI/LDWmpQ=";
      };
    };
  });
  meta = {
    description = "Nebula HW Interfaces Base";
  };
})
