{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-copyright,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ouxt_lint_common";
  version = "0.0.8-5";
  src = finalAttrs.passthru.sources."ouxt_lint_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-pep257 ament-cmake-xmllint ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-clang-format ament-cmake-copyright ament-cmake-pep257 ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "ouxt_lint_common" = substituteSource {
      src = fetchgit {
        name = "ouxt_lint_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "4211a290455e3fafbc7e8534725e86240ab08770";
        hash = "sha256-CzvbzrJWL16B2/c63ryLS008hT4dSu50P4AhU+lsHpQ=";
      };
    };
  });
  meta = {
    description = "common linter settings for OUXT Polaris ROS2 packages";
  };
})
