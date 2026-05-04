{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ouxt-lint-common,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ouxt_common";
  version = "0.0.8-5";
  src = finalAttrs.passthru.sources."ouxt_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ouxt-lint-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ouxt_common" = substituteSource {
      src = fetchgit {
        name = "ouxt_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "9c959a999218edaef61dd0aa26454d501213a868";
        hash = "sha256-4nyGy7HVcpb5Cb/zBa9+kz8o7aXZyGqY2Fdy17Xd9ZY=";
      };
    };
  });
  meta = {
    description = "common settings for OUXT Polaris ROS2 packages";
  };
})
