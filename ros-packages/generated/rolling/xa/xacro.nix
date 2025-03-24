{
  ament-cmake,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "xacro";
  version = "2.0.13-1";
  src = finalAttrs.passthru.sources."xacro";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ ament-index-python ];
  checkInputs = [ ament-cmake-pytest ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "xacro" = substituteSource {
      src = fetchgit {
        name = "xacro-source";
        url = "https://github.com/ros2-gbp/xacro-release.git";
        rev = "36e5a77883d6747c2f63e358224dbfeeaac49497";
        hash = "sha256-Ae2/r/JnHhwkwROhCaxMQcmrcgRQcdWliN/kCeQh9ec=";
      };
    };
  });
  meta = {
    description = "Xacro (XML Macros) Xacro is an XML macro language. With xacro, you can construct shorter and more readable XML files by using macros that expand to larger XML expressions.";
  };
})
