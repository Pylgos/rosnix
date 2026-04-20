{
  autoware-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nebula-core-common,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nebula_hesai_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."nebula_hesai_common";
  nativeBuildInputs = [ autoware-cmake ros-environment ];
  propagatedNativeBuildInputs = [ nebula-core-common ];
  buildInputs = [ autoware-cmake ros-environment ];
  propagatedBuildInputs = [ nebula-core-common ];
  passthru.sources = mkSourceSet (sources: {
    "nebula_hesai_common" = substituteSource {
      src = fetchgit {
        name = "nebula_hesai_common-source";
        url = "https://github.com/ros2-gbp/nebula-release.git";
        rev = "0b8404d95d0a88d38f46a037662abd066adc102c";
        hash = "sha256-ZqGaNAZ4kkzczOS37yjzuaW3Xel+KQathxHIUudT/mY=";
      };
    };
  });
  meta = {
    description = "Nebula Common Hesai Libraries and headers";
  };
})
