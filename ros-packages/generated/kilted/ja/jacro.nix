{
  ament-cmake,
  ament-cmake-pytest,
  ament-index-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "jacro";
  version = "0.2.0-3";
  src = finalAttrs.passthru.sources."jacro";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-jinja2" "python3-rich" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-jinja2" "python3-rich" ]; };
  checkInputs = [ ament-cmake-pytest std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pre-commit" ]; };
  passthru.sources = mkSourceSet (sources: {
    "jacro" = substituteSource {
      src = fetchgit {
        name = "jacro-source";
        url = "https://github.com/ros2-gbp/jacro-release.git";
        rev = "c451fb5c6fa270170e38d633f5cf5f589b536ce9";
        hash = "sha256-GOJXhMMGAjLXb36duyMfkUl89UDpZkL6feDp485vnMg=";
      };
    };
  });
  meta = {
    description = "TODO: Project Short Description";
  };
})
