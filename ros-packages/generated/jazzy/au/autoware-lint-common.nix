{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-cppcheck,
  ament-cmake-export-dependencies,
  ament-cmake-lint-cmake,
  ament-cmake-test,
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
  pname = "autoware_lint_common";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."autoware_lint_common";
  nativeBuildInputs = [ ament-cmake-export-dependencies ];
  propagatedNativeBuildInputs = [ ament-cmake-copyright ament-cmake-core ament-cmake-cppcheck ament-cmake-lint-cmake ament-cmake-test ament-cmake-xmllint ];
  passthru = {
    sources = mkSourceSet (sources: {
      "autoware_lint_common" = substituteSource {
        src = fetchgit {
          name = "autoware_lint_common-source";
          url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
          rev = "18799aeb6914ff30a282d4d668329f5a20c18ead";
          hash = "sha256-fS+Hicd3o8vyffKxyp4X3iosj9vznc4UJIbAH8Kp5BU=";
        };
      };
    });
  };
  meta = {
    description = "The list of commonly used linters in Autoware";
  };
})
