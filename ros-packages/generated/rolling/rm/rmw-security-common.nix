{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rmw,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_security_common";
  version = "7.8.2-1";
  src = finalAttrs.passthru.sources."rmw_security_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcutils rmw ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_security_common" = substituteSource {
      src = fetchgit {
        name = "rmw_security_common-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "85fd8106b2a9d71ecc5ddc905c9a1dd1bc33093c";
        hash = "sha256-/VpfFXBbUOMQdWlYuNEwYpRxcR+KJ5iqXeM9Wq5TXqg=";
      };
    };
  });
  meta = {
    description = "Define a common rmw secutiry utils";
  };
})
