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
  version = "0.0.8-4";
  src = finalAttrs.passthru.sources."ouxt_lint_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-pep257 ament-cmake-xmllint ];
  propagatedBuildInputs = [ ament-cmake-clang-format ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ouxt_lint_common" = substituteSource {
        src = fetchgit {
          name = "ouxt_lint_common-source";
          url = "https://github.com/ros2-gbp/ouxt_common-release.git";
          rev = "a35557bf5c608feca2e51f06e373948fc275c67a";
          hash = "sha256-CzvbzrJWL16B2/c63ryLS008hT4dSu50P4AhU+lsHpQ=";
        };
      };
    });
  };
  meta = {
    description = "common linter settings for OUXT Polaris ROS2 packages";
  };
})
