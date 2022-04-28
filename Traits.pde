JSONObject generateTraits(String n, float mh, float gf, int fR, int fG, int fB){
    JSONObject plantTrait = new JSONObject(); 
    
    plantTrait.setString("Name", n);
    plantTrait.setFloat("Max Height", mh);
    plantTrait.setFloat("Growth Factor", gf);
    plantTrait.setInt("Foliage Red", fR);
    plantTrait.setInt("Foliage Green", fG);
    plantTrait.setInt("Foliage Blue", fB);

    return plantTrait;
}
